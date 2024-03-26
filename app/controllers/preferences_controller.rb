class PreferencesController < ApplicationController
  def update
    @preference = Preference.find(params[:id])
    @preference.update(preference_params)
  end

  private

  def preference_params
    params.require(:preference).permit(:user_id, :level, appliances: [], ingredients: [], diet: [], allergies: [])
  end
end
