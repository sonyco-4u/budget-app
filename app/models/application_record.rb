# This class represents the primary abstract class for all ActiveRecord models in the application.
# It inherits from ActiveRecord::Base and is marked as an abstract class using the 'primary_abstract_class' method.
# This ensures that this class cannot be instantiated directly and
# serves as a starting point for defining domain-specific models.
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
