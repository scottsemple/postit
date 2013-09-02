module GenerateSlug
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.extend ClassMethods
    base.class_eval do
      my_class_method
    end
  end

  module InstanceMethods
    def generate_slug
      if self.respond_to?(:title)
        self.slug = self.title.gsub(' ', '-').downcase
      elsif self.respond_to?(:username)
        self.slug = self.username.gsub(' ', '-').downcase
      elsif self.respond_to?(:name)
        self.slug = self.name.gsub(' ', '-').downcase
      end
    end
  end

  module ClassMethods
    def my_class_method
      puts 'Test slug module'
    end
  end
end