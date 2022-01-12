# Responsável por exibir o nome da 
# Applicação nas Requisições
#
class AppName
  def initialize(app, app_name)
    @app = app
    @app_name = app_name
  end

  def call(env)
    status, headers, response = @app.call(env)
    headers.merge!({'X-APP-NAME' => "#{@app_name}"})
     [status, headers, [response.body]]
  end
end