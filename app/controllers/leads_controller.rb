require "#{Rails.root}/app/domains/leads"

class LeadsController < ApplicationController
  def create
    ret = Domains::Leads.new(JSON.parse(request.body.read, symbolize_names: true)).call
    render json: {errors: ret.errors}, status: :ok
  end
end
