WorldData <- map_data('world')
WorldData %>% filter(region != "Antarctica") -> WorldData
WorldData <- fortify(WorldData)
p <- ggplot()
p <- p + geom_map(data=WorldData, map=WorldData,
                  aes(x=long, y=lat, group=group, map_id=region),
                  fill="white", colour="#7f7f7f", size=0.5)
p <- p + geom_map(data=df, map=WorldData,
                  aes(fill=value, map_id=country),
                  colour="#7f7f7f", size=0.5)
p <- p + coord_map("rectangular", lat0=0, xlim=c(-180,180), ylim=c(-60, 90))
p <- p + scale_fill_continuous(low="#fff32", high="ffff00", 
                               guide="colorbar")
p <- p + theme_bw()
p <- p + theme(panel.border = element_blank())
p 


ggplot(df, aes(map_id = country)) + 
    geom_map(aes(fill = value), map = worldMap, color='grey', size=0.3) + 
    expand_limits(x = worldMap$long, y = worldMap$lat) +
    theme_few()+
    theme(legend.position = "bottom",
         axis.ticks = element_blank(), 
         axis.title = element_blank(), 
         axis.text =  element_blank()) +
    scale_fill_gradient(low="white", high="darkblue", name="Number of Affiliates") +
    guides(fill = guide_colorbar(barwidth = 10, barheight = .5))





region = c("USA","Canada","UK","Slovenia","Spain","France","Belgium","Germany","Czech Republic","Sweden","Hungary","Argentina", "Australia", "Bulgaria", "Chile", "Columbia", "Finland", "Japan", "Republic of Korea", "Peru", "Poland", "Portugal", "Slovaka")
value=c(1,1,1,10000,10000,10000,10000,10000,10000,10000,10000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000,20000)
df=data.frame(region,value)



p <- ggplot()
p <- p + geom_map(data=WorldData, map=WorldData,
                  aes(x=long, y=lat, group=group, map_id=region),
                  fill="white", colour="#7f7f7f", size=0.5)
p <- p + geom_map(data=df, map=WorldData,
                  aes(fill=value, map_id=region),
                  colour="#7f7f7f", size=0.5)
p <- p + coord_map("rectangular", lat0=0, xlim=c(-180,180), ylim=c(-60, 90))
p <- p + scale_fill_gradientn(colours = c('#669900', '#ffff00', '#0000ff'))
p <- p + scale_y_continuous(breaks=c())
p <- p + scale_x_continuous(breaks=c())
p <- p + theme_bw()
p <- p + theme(panel.border = element_blank())
p 
