class GistQuestionService
  ACCESS_TOKEN = 'fe70d3814acc329c9185cd153d31c63aed04fc57'

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ACCESS_TOKEN)
  end

  def call
    @client.create_gist(gist_params)
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