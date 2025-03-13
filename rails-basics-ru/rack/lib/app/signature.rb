# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, body = @app.call(env)

    new_body = body.join

    sha256 = Digest::SHA256.hexdigest(new_body)

    [status, headers, [new_body, sha256]]
    # END
  end
end
