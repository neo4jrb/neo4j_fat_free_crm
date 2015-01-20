# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
class List
  include Neo4j::ActiveNode

  validates_presence_of :name
  validates_presence_of :url
  has_one :out, :user, type: :user

  # Parses the controller from the url
  def controller
    (url || "").sub(/\A\//, '').split(/\/|\?/).first
  end

  ActiveSupport.run_load_hooks(:fat_free_crm_list, self)
end
