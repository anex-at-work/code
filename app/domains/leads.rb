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
          # of course, here we should find the right class
          if 'gartenbauorg' == lead[:lead][:category]
            @res = Domains::Epids::Gartenbauorg.new(lead[:lead]).output
            p @res
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
