json.array!(@orders) do |order|
  json.extract! order, :id, :order_type_id, :concept_id, :orderer, :encounter_id, :instructions, :start_date, :auto_expire_date, :discontinued, :discontinued_date, :discontinued_by, :discontinued_reason, :creator, :date_created, :voided, :voided_by, :date_voided, :void_reason, :patient_id, :accession_number, :uuid
  json.url order_url(order, format: :json)
end
