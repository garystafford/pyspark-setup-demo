from bokeh.io import output_notebook, show
from bokeh.plotting import figure
from bokeh.models import ColumnDataSource
from bokeh.transform import factor_cmap

output_notebook()

source = ColumnDataSource(data=df5.toPandas())

tooltips=[('item', '@item'),('count', '@{count}{,}')]

items = source.data['item'].tolist()
color_map = factor_cmap(field_name='item', palette=Paired12, factors=items)
plot = figure(x_range=items, plot_width=750, plot_height=375, min_border=0, tooltips=tooltips)
plot.vbar(x='item', bottom=0, top='count', source=source, width=0.9, fill_color=color_map)
plot.title.text ='Top 10 Barkery Items'
plot.xaxis.axis_label = 'Bakery Items'
plot.yaxis.axis_label = 'Total Items Sold'

show(plot)