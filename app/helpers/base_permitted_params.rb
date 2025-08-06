class BasePermittedParams
  def self.permitted_params_for(params:)
    params.permit(self::PERMITTED_PARAMS.dup)
  end
end
