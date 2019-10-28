class ApplicationController < ActionController::Base
    include Pagy::Backend

    $doc_status=['Aprobado', 'Rechazado', 'Pendiente', 'Cancelado']
end
