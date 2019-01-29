require "#{Rails.root}/app/schemas/leads"
require "#{Rails.root}/app/domains/epids/epids"

module Domains
  class Leads
    def initialize(leads)
      @leads = leads
      @errors = []
      @res = []
    end

    def call
      @leads.each do |lead|
        res = LeadSchema.call(lead)
        if res.success?
          begin
            klass = "Domains::Epids::#{lead[:lead][:category].classify}".constantize
            p klass.new(lead[:lead]).output
          rescue
          end
        else
          @errors << res.errors
        end
      end
      self
    end

    def errors
      @errors
    end

    def res
      @res
    end
  end
end
