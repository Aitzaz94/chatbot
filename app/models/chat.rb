class Chat < ApplicationRecord
    before_validation(on: :create) do
        self.session_id = SecureRandom.hex(10)
    end
end
