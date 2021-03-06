class StudentsController < ApplicationController

  #index
  get '/students' do
    @students = Student.all
    erb :'students/index'
  end

  #new
  get '/students/new' do
    #this route needs to go above routes that are less specific
    erb :'students/new'
  end

  #create
  post '/students' do
    student = Student.create(params[:student])
    redirect to "/students/#{student.id}"
  end

  #show
  get '/students/:id' do
    #binding.pry
    id = params[:id]
    @student = Student.find_by(id: id)
    erb :'students/show'
  end

  #edit
  get '/students/:id/edit' do
    @student = Student.find_by(id: params[:id])
    erb :'students/edit'
  end

  #update
  put '/students/:id' do
    student = Student.find_by(id: params[:id])
    student.update(params[:student])
    redirect to "/students/#{student.id}"
  end

  #destroy
  delete '/students/:id' do
    student = Student.find_by(id: params[:id])
    student.destroy
    redirect to "/students"
  end

end
