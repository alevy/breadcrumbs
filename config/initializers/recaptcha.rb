Recaptcha.configure do |config|
  config.public_key  = ENV["RECAPTCHA_PUBLIC_KEY"] || '6LcijMoSAAAAAL5Mm3Sq5BaaHjjeSBRl46mxB7iW'
  config.private_key = ENV["RECAPTCHA_PRIVATE_KEY"] || '6LcijMoSAAAAAKigWG1faZ47764oo0bFZxr8tFbh'
end
