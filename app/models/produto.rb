class Produto < ActiveRecord::Base
  audited
  has_many :os_tarefas, class_name: "OsTarefa", foreign_key: "prod_id"
end
