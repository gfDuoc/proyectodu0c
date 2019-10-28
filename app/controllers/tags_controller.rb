class TagsController < ApplicationController
  before_action :authenticate_user!

  def index
    nada = []
    @pagy_a,@data = pagy(Tag.all)
  end#action

  def show
    @data = Tag.find(params[:id])
  end#action

  def new
    @data = Tag.new
  end#action

  def edit
    @data = Tag.find(params[:id])
  end#action

  def create
    @data = new_tag(params)
  end#action

  
  #######
  private
  #######
  def new_tag(params)
    ret = false
    tag = Tag.new
    tag.description = params[:description]
    if  tag.save
      params[:result] = 'Etiqueta creada'
      ret = tag
    else
      params[:result] = 'no se pudo crear etiqueta'
    end
    ret
  end#method

  def update_tag(params)
    ret = false
    change = false
    data = Tag.find(params[:id])
    if params["description"].present? && data.description != params["description"]
      data.description = params["description"]
      change = true
    end#if
    if change
      if  doc.save
        ret = doc
      else
        ret = false
      end
      params[:result] = 'se actualizo etiqueta'
    else
      params[:result] = 'No hay cambio en la etiqueta'
    end
    ret
  end#method
end # of de class
