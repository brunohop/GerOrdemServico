class Catalogo < ActiveRecord::Base
  has_many :os_tarefas, class_name: "OsTarefa", foreign_key: "catl_id"
end
