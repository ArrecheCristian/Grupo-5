class Residence < ApplicationRecord
	 scope:ordenFecha,->{order("created_at desc")}
end
