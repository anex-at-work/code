require "#{Rails.root}/app/domains/leads"

class LeadsController < ApplicationController
  def create
    ret = Domains::Leads.new(JSON.parse(request.body.read, symbolize_names: true)).call
    render json: {errors: ret.errors}, status: 403 if ret.errors.any?
    render json: ret.res, status: 200
  end
end
