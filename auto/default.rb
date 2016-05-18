class DeveloperController < ApplicationController

  before_filter :signed_in_user

  def developer
  end

  def get

    begin
      path = params[:path] + ".rb"
      sha = Repo::version path
      content = Repo::contents path, sha
      render json: { path: path, sha: sha, content: content, errors: [] }
    rescue Exception => e
      render json: { errors: [ e.to_s ] }
    end

  end

  def save
    path = params[:path] + ".rb"
    begin
      Repo::save path, params[:content]
      sha = Repo::version path
      render json: { errors: [], sha: sha }
    rescue Exception => e
      render json: { errors: [ e.to_s ] }
    end
  end

end
