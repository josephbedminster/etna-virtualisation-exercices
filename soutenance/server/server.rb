# myapp.rb
# encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'json'

get '/' do
	'Hello world!'
end

post '/instantiate_ue' do
	body = request.body.read
	
	if request.body.read == nil
		logger.error "No post data"
		return 0
	end

	%x[ ./RunClearDocker.sh ]
	parsedJson = JSON.parse(body)
	link = "\""
	conf = "\"server {listen 80;server_name 213.32.21.139;"
	logger.info parsedJson

	container = parsedJson["container"]
	parsedJson["logins"].each do |login|
		if %x[ ./RunExerciceController.sh #{login} #{container} ] != 0
			logger.error "Something went wrong"
		end
		link += " --link " + login
		conf += "location /" + login + "{proxy_pass http://" + login + "/;}"
	end
	conf += "}\""
	link += "\""
	if %x[ ./RunCreerUEController.sh #{conf} #{link} ] != 0
		logger.error "Something went wrong"
	end
end

get '/instantiate_etape' do
	login = params[:login]
	container = params[:container]
	if %x[ ./RunExerciceController.sh #{login} #{container} ] != 0
		logger.error "Something went wrong"
	end
end

post '/instantiate_docker' do
	body = request.body.read
	
	if request.body.read == nil
		logger.error "No post data"
		return 0
	end
	parsedJson = JSON.parse(body)
	logger.error parsedJson["dockerfile"]
	docker_name = parsedJson["name"]
	dockerfile = "\'" + parsedJson["dockerfile"] + "\'"

	if %x[ ./RunCreerDocker.sh #{dockerfile} #{docker_name} ] != 0
		logger.error "Something went wrong"
	end
end