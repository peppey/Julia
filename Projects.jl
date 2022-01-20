# https://www.youtube.com/watch?v=Ls7bZ2G1veI
function song(start::Integer)
    lines(i) = i == 0 ? "No more lines" : i == 1 ? "1 line" : "$i lines"
    for i in start:-1:1
        println("""
            $(lines(i)) of Code on the Screen,
            $(lines(i)) of Code...
            \t Control the Flow, 
            \t Delete one Row,
            $(lines(i - 1)) of Code on the Screen!!!
            """)
    end
end

song(7)