class SettingsController < ApplicationController

  def index
    @multipliers = Multiplier.all
  end

  def update
    m = params[:multipliers]
    multipliers = m

    puts multipliers.inspect

    @multipliers = Multiplier.all()

    @multipliers.each do |multiplier|
      multiplier.update_attribute(:value, multipliers[multiplier.id.to_s])
    end

    redirect_to settings_path
  end
end
