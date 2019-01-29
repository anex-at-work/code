require 'dry-validation'

LeadSchema = Dry::Validation.Schema do
  required(:lead).schema do
    required(:id).filled
    required(:trade_id).filled
    required(:details).schema do
      optional(:image_widths).filled
      optional(:image_heights).filled
      optional(:project_deadline).filled
      optional(:project_surface).filled
      optional(:project_height).filled
      optional(:project_place).filled
    end
    required(:closed_at).maybe(:str?)
    required(:expiration_date).filled
    required(:lost_at).maybe(:str?)
    required(:created_at).filled
    required(:updated_at).filled
    required(:order_type).maybe(:str?)
    required(:comment).filled
    required(:uid).filled
    required(:user_type).maybe(:str?)
    required(:request_type).maybe(:str?)
    required(:category).filled
    required(:rejected_at).maybe(:str?)
    required(:partner_id).maybe(:int?)
    required(:lost_reason).maybe(:str?)
    required(:partner_ids).filled
    required(:pics).filled
    required(:user_picked_account_id).maybe(:int?)
    required(:service_performed).maybe(:str?)
    required(:cipid).maybe(:int?)
    required(:specialisation_id).maybe(:int?)
  end
end
