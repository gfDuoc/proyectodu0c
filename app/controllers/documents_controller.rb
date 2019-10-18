class DocumentsController < ApplicationController

def index
    nada = []
    @pagy_a,@data = pagy_array(nada)
end

end
