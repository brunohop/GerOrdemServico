class Catalogo < ActiveRecord::Base
  audited
  has_many :os_tarefas, class_name: "OsTarefa", foreign_key: "catl_id"
end
