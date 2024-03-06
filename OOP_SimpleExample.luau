--Класс:
local Cars = {}
--Тело класса:
function Cars:new(model:string, age:number, topSpeed:number)
	
	--свойства:
	local properties = {
		Model = model,
		Age = age,
		TopSpeed = topSpeed
	}
	
	--метод1:
	function properties:getModel()
		return self.Model
	end
	
	--метод2:
	function properties:getInfo()
		return self
	end
	
	--метод3:
	function properties:x2Boost()
		coroutine.wrap(function()
			self.TopSpeed *= 2
			for i = 10, 0, -1 do
				print("Бонус к скорости! Осталось времени:", i)
				task.wait(1)
			end
			self.TopSpeed /= 2
		end)()
	end
	
	--метатаблица:
	setmetatable(properties, self)
	self.__index = self
	return properties
end

--создание экземпляра класса:
local Ferrari = Cars:new("Ferrari SF90 Stradale", 2019, 340)
local Lamborghini = Cars:new("Lamborghini Murcielago", 2005, 342)

--обращение к свойству:
print(Ferrari.Model) --> Ferrari SF90 Stradale
print(Lamborghini.TopSpeed) -->  342

--тестирование методов:
Ferrari:x2Boost() --> активация "ускорения"! Так как у нас работает корутина, остальные команды ниже также будут выполнены.
print(Lamborghini:getInfo()) --> вывод всех свойств и методов объекта Lamborghini в виде таблицы
print(Ferrari:getModel()) --> Вывод названия модели машины
