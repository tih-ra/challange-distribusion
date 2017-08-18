FactoryGirl.define do
  factory :route do
    passphrase { Faker::Zelda.character }
    source ["sentinels", "sniffers", "loopholes"].sample
    start_node ["alpha", "beta", "gamma", "delta", "theta", "lambda", "tau", "psi", "omega"].sample
    end_node ["alpha", "beta", "gamma", "delta", "theta", "lambda", "tau", "psi", "omega"].sample
    start_time "2010-09-06T12:27:00"
    end_time "2010-10-06T11:22:02"
  end
end
