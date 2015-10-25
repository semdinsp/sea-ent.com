


module Nesta
  module Navigation
    module Renderers
      def current_menu_item_class
              'active'
            end
    end
  end
  class App
    not_found do
      cache haml("404".to_sym)
    end
    
    post '/downloadfile' do
      puts "download #{params}"
      msg=""
      mtype=:notice
      begin
        puts "sending file to #{params}"
        f=FiconabSES::Base.new
        f.set_credentials('scott','scott123')
        msg =f.send_template_params(params['email'],'download_file',params)
      rescue Exception => e
        mtype=:error
        msg=e.inspect
      end if params['email']!='jane.doe@example.com'
      puts msg
    #  teds_flash_and_redirect(msg,mtype,"/contact")
      redirect to('/summary')
    end
  end
end