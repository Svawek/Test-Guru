class GistQuestionService
  ACCESS_TOKEN = ENV['GITHUB_TOKEN']

  def initialize(question)
    @question = question
    @test = @question.test
    @client = Octokit::Client.new(:access_token => ACCESS_TOKEN)
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.status == 201
  end

  private

  def gist_params
    {
        description: I18n.t('.description', title: @test.title),
        files: {
            'test-guru-question.txt' => {
                content: gist_content
            }
        }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end