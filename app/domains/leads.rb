require "#{Rails.root}/app/schemas/leads"

module Domains
  class Leads
    def initialize(leads)
      @leads = leads
      @errors = []
    end

    def call
      @leads.each do |lead|
        res = LeadSchema.call(lead)
        if res.success?
          
        else
          @errors << res.errors
        end
      end
      self
    end

    def errors
      @errors
    end
  end
end
