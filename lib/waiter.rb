require 'pry'
class Waiter

    @@all = []

    attr_accessor :name, :year_of_experience

    def initialize(name, year_of_experience)
        @name = name
        @year_of_experience = year_of_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select{|meal| meal.waiter == self}
    end

    def best_tipper
        best_tipper = meals.max{|meal_a, meal_b| meal_a.tip <=> meal_b.tip}
        best_tipper.customer
    end
end