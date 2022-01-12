class V1::EnterpriseSerializer < ActiveModel::Serializer
  attributes :id, :name, :rooms_number, :opening_time, :ending_time

  meta do 
      { "author": "Alexandre Sampaio - SpiderCod3R" }
    end
end
