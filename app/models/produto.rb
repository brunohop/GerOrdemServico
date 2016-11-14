class Produto < ActiveRecord::Base
  has_many :os_tarefas, class_name: "OsTarefa", foreign_key: "prod_id"
end
