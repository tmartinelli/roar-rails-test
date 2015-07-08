module BeneficiariosRepresenter
  include Roar::JSON

  collection :beneficiarios, class: Beneficiario, extend: BeneficiarioRepresenter
end
