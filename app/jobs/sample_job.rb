class SampleJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "sidekiqを実行しました！！！！！"
  end
end
