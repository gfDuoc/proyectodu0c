class DocumentsController < ApplicationController

  def index
    nada = []
    @pagy_a,@data = pagy(Document.all)
  end

  def new
    if user_signed_in?
      @tag = Tag.all
      render "new"
    else
      redirect_to  action: "index"
    end
  end

  def show
    if  Document.where("id = ?", params[:id]).present?
      @data = Document.find(params[:id])
    else
      flash[:danger] = "Documento no encontrado!"
    end#if
  end


  def edit
    if  Document.where("id = ?", params[:id]).present?
            @tag = Tag.all
      @data = Document.find(params[:id])
    else
      flash[:danger] = "Documento no encontrado!"
    end#id
  end


  def destroy
    @data = Document.find(params[:id])
    @data.destroy
    redirect_to document_path
  end


  def create
    puts params
    @data = new_document(params)
    if @data.present?
      if params[:anex].present?
        @data.anex.attach(params[:anex])
      end#if
      flash[:success] = params[:result]
      redirect_to @data
    else
      flash[:danger] = params[:result]
      render 'new'
    end#present?
  end

  def update
    @data = update_document(params)
    if @data.present?
      if params[:anex].present?
        @data.anex.attach(params[:anex])
      end#if
      redirect_to @data
      flash[:success] = params[:result]
    else
      render 'edit'
      flash[:danger] = params[:result]
    end
  end

  def delete
  end

  ########
  private
  ########

  def  new_document(params)
    doc = Document.new
    ret = false
    doc.name = params["nombre"]
    doc.typo  = params[:anex].content_type
    doc.date = params["fecha"]
    doc.author = params["autor"]
    doc.company = params["compania"]
    doc.user_id = params["user"]
    doc.note = params["note"]
    doc.tag = params["tag"]
    doc.status = "Pendiente"
    if  doc.save
      params[:result] = 'Documento creado'
      ret = doc
    else
      params[:result] = 'no se pudo crear document'
    end
    ret
  end

  def update_document(params)
    ret = false
    change = false
    doc = Document.find(params[:id])
    if params["nombre"].present? && doc.name != params["nombre"]
      doc.name = params["nombre"]
      change = true
    end
    if params["fecha"].present? && doc.date != params["fecha"]
      doc.date = params["fecha"]
      change = true
    end
    if params["author"].present? && doc.author != params["author"]
      doc.author = params["author"]
      change = true
    end
    if params["company"].present? && doc.company != params["company"]
      doc.company = params["company"]
      change = true
    end
    if params["tag"].present? && doc.tag != params["tag"]
      doc.tag = params["tag"]
      change = true
    end
    if params["note"].present? && doc.note != params["note"]
      doc.note = params["note"]
      change = true
    end
    if params["anex"].present? && doc.typo != params["anex"].content_type
      doc.typo = params["anex"].content_type
      change = true
    end
    if change
      doc.status = "Pendiente"
      if  doc.save
        ret = doc
      else
        ret = false
      end
      params[:result] = 'se  cambio en el documento'
    else
      params[:result] = 'No hay cambio en el documento'
    end
    ret
  end



  #end of class
end
