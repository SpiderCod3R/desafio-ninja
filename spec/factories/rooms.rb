FactoryBot.define do
  factory :room do
    association :enterprise
    name { roomsName.sample }
  end
end

def roomsName
  %w(Treinamento Reunião Auditorio Entrevista)
end