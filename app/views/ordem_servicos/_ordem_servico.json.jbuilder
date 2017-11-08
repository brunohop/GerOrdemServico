json.extract! ordem_servico, :id, :fiscalcontrato, :projeto_id, :preposto, :resptecnico, :descricao, :sprint, :data_inicio, :data_previsao, :data_fim, :situacao, :resp_requisitante, :tipo_os_id, :fator_atendimento, :ust_pago, :ust_glosa, :fechamento,:valor_ust_id, :created_at, :updated_at
json.url ordem_servico_url(ordem_servico, format: :json)
