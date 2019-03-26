Pod::Spec.new do |spec|

  spec.name         = "NetworkTransaction"
  spec.version      = "0.0.1"
  spec.summary      = "This framework will allow apps to easily define what is needed for network calls"
  spec.description  = <<-DESC
This framework makes network calls and setup easy. It makes use of Decodable protocol and generics to make it easy to use. The setup uses a protocol called ServiceConfiguration to define what is needed for the network calls.
                   DESC
  spec.license      = "MIT"
  spec.author       = "Paul Renfrew, Jr."
  spec.platform     = :ios
  spec.source       = { :git => "https://github.com/prrenfrew/NetworkTransaction.git", :tag => 'master' }
  spec.source_files = "NetworkTransaction/**/*.swift"
  spec.homepage     = "https://github.com/prrenfrew/NetworkTransaction"
end
