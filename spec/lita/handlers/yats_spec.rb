require "spec_helper"

describe Lita::Handlers::Yats, lita_handler: true do
  it { is_expected.to route_command("yats").to(:menu) }
end
