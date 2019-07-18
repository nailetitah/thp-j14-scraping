require_relative '../lib/cher_depute'

describe "get_deputy_urls method" do
  it "checks if it get deputy urls" do
    expect(get_deputy_urls).not_to be_nil
end
end

describe "get_townhall_infos method" do
  it "checks if it get townhall infos" do
    expect(get_deputy_infos('https://www.nosdeputes.fr/francoise-dumas')).to eq({"first_name"=>"Françoise", "last_name"=>"Dumas", "email"=>"francoise.dumas@assemblee-nationale.fr"})
end
end