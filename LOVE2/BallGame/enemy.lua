local love = require("love")

function Enemy()
    local dice = math.random(1, 4)
    local _x, _y
    local _radius = 20

    if dice == 1 then
        _x = math.random(_radius, love.graphics.getWidth())
        _y = - _radius * 4
    elseif dice == 2 then
        _x = - _radius * 4
        _y = math.random(_radius, love.graphics.getHeight())
    elseif dice == 3 then
        _x = math.random(_radius, love.graphics.getWidth())
        _y = _radius * 4 + love.graphics.getHeight()
    else
        _x = _radius * 4 + love.graphics.getWidth()
        _y = math.random(_radius, love.graphics.getHeight())
    end

    return {
        level = 1.5,
        radius = _radius,
        x = _x,
        y = _y,

        move = function (self, player_x, player_y)
            if player_x > self.x then
                self.x = self.x + self.level
            elseif player_x < self.x then
                self.x = self.x - self.level
            end

            if player_y > self.y then
                self.y = self.y + self.level
            elseif player_y < self.y then
                self.y = self.y - self.level
            end
        end,

        draw = function (self)
            love.graphics.setColor(1, 0.5, 7)

            love.graphics.circle("fill", self.x, self.y, self.radius)
            love.graphics.setColor(1, 1, 1)
        end
    }
end

return Enemy