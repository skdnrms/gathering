<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="/GatheringWeb/resources/shared/js/fullcalendar.min.js" type="text/javascript"></script>

<link href="/GatheringWeb/resources/shared/css/fullcalendar.css" rel="stylesheet" type="text/css" />
<link href="/GatheringWeb/resources/shared/css/fullcalendar.print.css" rel="stylesheet" type="text/css" media='print' />

<!-- 
<section class="content">
	<div class="box box-primary">
		<div class="box-body no-padding">
			
			THE CALENDAR
			<div id="calendar" class="fc fc-ltr">
				<table class="fc-header" style="width: 100%">
					<tbody>
						<tr>
							<td class="fc-header-left"><span
								class="fc-button fc-button-prev fc-state-default fc-corner-left"
								unselectable="on"><span class="fa fa-caret-left">◀</span></span><span
								class="fc-button fc-button-next fc-state-default fc-corner-right"
								unselectable="on"><span class="fa fa-caret-right">▶</span></span><span
								class="fc-header-space"></span><span
								class="fc-button fc-button-today fc-state-default fc-corner-left fc-corner-right fc-state-disabled"
								unselectable="on">today</span></td>
							<td class="fc-header-center"><span class="fc-header-title"><h2>April
										2014</h2></span></td>
							<td class="fc-header-right"><span
								class="fc-button fc-button-month fc-state-default fc-corner-left fc-state-active"
								unselectable="on">month</span><span
								class="fc-button fc-button-agendaWeek fc-state-default"
								unselectable="on">week</span><span
								class="fc-button fc-button-agendaDay fc-state-default fc-corner-right"
								unselectable="on">day</span></td>
						</tr>
					</tbody>
				</table>
				<div class="fc-content" style="position: relative;">
					<div class="fc-view fc-view-month fc-grid"
						style="position: relative" unselectable="on">
						<div class="fc-event-container"
							style="position: absolute; z-index: 8; top: 0; left: 0">
							<div
								class="fc-event fc-event-hori fc-event-draggable fc-event-start fc-event-end"
								style="position: absolute; left: 235px; background-color: rgb(245, 105, 84); border-color: rgb(245, 105, 84); width: 111px; top: 44px;">
								<div class="fc-event-inner">
									<span class="fc-event-title">All Day Event</span>
								</div>
								<div class="ui-resizable-handle ui-resizable-e">&nbsp;&nbsp;&nbsp;</div>
							</div>
							<div
								class="fc-event fc-event-hori fc-event-draggable fc-event-start fc-event-end"
								style="position: absolute; left: 2px; background-color: rgb(243, 156, 18); border-color: rgb(243, 156, 18); width: 460px; top: 239px;">
								<div class="fc-event-inner">
									<span class="fc-event-title">Long Event</span>
								</div>
								<div class="ui-resizable-handle ui-resizable-e">&nbsp;&nbsp;&nbsp;</div>
							</div>
							<div
								class="fc-event fc-event-hori fc-event-draggable fc-event-start fc-event-end"
								style="position: absolute; left: 583px; background-color: rgb(0, 115, 183); border-color: rgb(0, 115, 183); width: 111px; top: 239px;">
								<div class="fc-event-inner">
									<span class="fc-event-time">10:30a</span><span
										class="fc-event-title">Meeting</span>
								</div>
								<div class="ui-resizable-handle ui-resizable-e">&nbsp;&nbsp;&nbsp;</div>
							</div>
							<div
								class="fc-event fc-event-hori fc-event-draggable fc-event-start fc-event-end"
								style="position: absolute; left: 583px; background-color: rgb(0, 192, 239); border-color: rgb(0, 192, 239); width: 111px; top: 259px;">
								<div class="fc-event-inner">
									<span class="fc-event-time">12p</span><span
										class="fc-event-title">Lunch</span>
								</div>
								<div class="ui-resizable-handle ui-resizable-e">&nbsp;&nbsp;&nbsp;</div>
							</div>
							<div
								class="fc-event fc-event-hori fc-event-draggable fc-event-start fc-event-end"
								style="position: absolute; left: 699px; background-color: rgb(0, 166, 90); border-color: rgb(0, 166, 90); width: 115px; top: 239px;">
								<div class="fc-event-inner">
									<span class="fc-event-time">7p</span><span
										class="fc-event-title">Birthday Party</span>
								</div>
								<div class="ui-resizable-handle ui-resizable-e">&nbsp;&nbsp;&nbsp;</div>
							</div>
							<a href="http://google.com/"
								class="fc-event fc-event-hori fc-event-draggable fc-event-start fc-event-end ui-draggable"
								style="position: absolute; left: 119px; background-color: rgb(60, 141, 188); border-color: rgb(60, 141, 188); width: 227px; top: 433px;"
								unselectable="on"><div class="fc-event-inner">
									<span class="fc-event-title">Click for Google</span>
								</div>
								<div class="ui-resizable-handle ui-resizable-e">&nbsp;&nbsp;&nbsp;</div></a>
						</div>
						<table class="fc-border-separate" style="width: 100%"
							cellspacing="0">
							<thead>
								<tr class="fc-first fc-last">
									<th class="fc-day-header fc-sun fc-widget-header fc-first"
										style="width: 116px;">Sun</th>
									<th class="fc-day-header fc-mon fc-widget-header"
										style="width: 116px;">Mon</th>
									<th class="fc-day-header fc-tue fc-widget-header"
										style="width: 116px;">Tue</th>
									<th class="fc-day-header fc-wed fc-widget-header"
										style="width: 116px;">Wed</th>
									<th class="fc-day-header fc-thu fc-widget-header"
										style="width: 116px;">Thu</th>
									<th class="fc-day-header fc-fri fc-widget-header"
										style="width: 116px;">Fri</th>
									<th class="fc-day-header fc-sat fc-widget-header fc-last">Sat</th>
								</tr>
							</thead>
							<tbody>
								<tr class="fc-week fc-first">
									<td
										class="fc-day fc-sun fc-widget-content fc-other-month fc-past fc-first"
										data-date="2014-03-30"><div style="min-height: 97px;">
											<div class="fc-day-number">30</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 20px;">&nbsp;</div>
											</div>
										</div></td>
									<td
										class="fc-day fc-mon fc-widget-content fc-other-month fc-past"
										data-date="2014-03-31"><div>
											<div class="fc-day-number">31</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 20px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-tue fc-widget-content fc-past"
										data-date="2014-04-01"><div>
											<div class="fc-day-number">1</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 20px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-wed fc-widget-content fc-past"
										data-date="2014-04-02"><div>
											<div class="fc-day-number">2</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 20px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-thu fc-widget-content fc-past"
										data-date="2014-04-03"><div>
											<div class="fc-day-number">3</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 20px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-fri fc-widget-content fc-past"
										data-date="2014-04-04"><div>
											<div class="fc-day-number">4</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 20px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-sat fc-widget-content fc-past fc-last"
										data-date="2014-04-05"><div>
											<div class="fc-day-number">5</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 20px;">&nbsp;</div>
											</div>
										</div></td>
								</tr>
								<tr class="fc-week">
									<td class="fc-day fc-sun fc-widget-content fc-past fc-first"
										data-date="2014-04-06"><div style="min-height: 96px;">
											<div class="fc-day-number">6</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-mon fc-widget-content fc-past"
										data-date="2014-04-07"><div>
											<div class="fc-day-number">7</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-tue fc-widget-content fc-past"
										data-date="2014-04-08"><div>
											<div class="fc-day-number">8</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-wed fc-widget-content fc-past"
										data-date="2014-04-09"><div>
											<div class="fc-day-number">9</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-thu fc-widget-content fc-past"
										data-date="2014-04-10"><div>
											<div class="fc-day-number">10</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-fri fc-widget-content fc-past"
										data-date="2014-04-11"><div>
											<div class="fc-day-number">11</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-sat fc-widget-content fc-past fc-last"
										data-date="2014-04-12"><div>
											<div class="fc-day-number">12</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
								</tr>
								<tr class="fc-week">
									<td class="fc-day fc-sun fc-widget-content fc-past fc-first"
										data-date="2014-04-13"><div style="min-height: 96px;">
											<div class="fc-day-number">13</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 40px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-mon fc-widget-content fc-past"
										data-date="2014-04-14"><div>
											<div class="fc-day-number">14</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 40px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-tue fc-widget-content fc-past"
										data-date="2014-04-15"><div>
											<div class="fc-day-number">15</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 40px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-wed fc-widget-content fc-past"
										data-date="2014-04-16"><div>
											<div class="fc-day-number">16</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 40px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-thu fc-widget-content fc-past"
										data-date="2014-04-17"><div>
											<div class="fc-day-number">17</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 40px;">&nbsp;</div>
											</div>
										</div></td>
									<td
										class="fc-day fc-fri fc-widget-content fc-today fc-state-highlight"
										data-date="2014-04-18"><div>
											<div class="fc-day-number">18</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 40px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-sat fc-widget-content fc-future fc-last"
										data-date="2014-04-19"><div>
											<div class="fc-day-number">19</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 40px;">&nbsp;</div>
											</div>
										</div></td>
								</tr>
								<tr class="fc-week">
									<td class="fc-day fc-sun fc-widget-content fc-future fc-first"
										data-date="2014-04-20"><div style="min-height: 96px;">
											<div class="fc-day-number">20</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-mon fc-widget-content fc-future"
										data-date="2014-04-21"><div>
											<div class="fc-day-number">21</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-tue fc-widget-content fc-future"
										data-date="2014-04-22"><div>
											<div class="fc-day-number">22</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-wed fc-widget-content fc-future"
										data-date="2014-04-23"><div>
											<div class="fc-day-number">23</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-thu fc-widget-content fc-future"
										data-date="2014-04-24"><div>
											<div class="fc-day-number">24</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-fri fc-widget-content fc-future"
										data-date="2014-04-25"><div>
											<div class="fc-day-number">25</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-sat fc-widget-content fc-future fc-last"
										data-date="2014-04-26"><div>
											<div class="fc-day-number">26</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
								</tr>
								<tr class="fc-week">
									<td class="fc-day fc-sun fc-widget-content fc-future fc-first"
										data-date="2014-04-27"><div style="min-height: 96px;">
											<div class="fc-day-number">27</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 20px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-mon fc-widget-content fc-future"
										data-date="2014-04-28"><div>
											<div class="fc-day-number">28</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 20px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-tue fc-widget-content fc-future"
										data-date="2014-04-29"><div>
											<div class="fc-day-number">29</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 20px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-wed fc-widget-content fc-future"
										data-date="2014-04-30"><div>
											<div class="fc-day-number">30</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 20px;">&nbsp;</div>
											</div>
										</div></td>
									<td
										class="fc-day fc-thu fc-widget-content fc-other-month fc-future"
										data-date="2014-05-01"><div>
											<div class="fc-day-number">1</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 20px;">&nbsp;</div>
											</div>
										</div></td>
									<td
										class="fc-day fc-fri fc-widget-content fc-other-month fc-future"
										data-date="2014-05-02"><div>
											<div class="fc-day-number">2</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 20px;">&nbsp;</div>
											</div>
										</div></td>
									<td
										class="fc-day fc-sat fc-widget-content fc-other-month fc-future fc-last"
										data-date="2014-05-03"><div>
											<div class="fc-day-number">3</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 20px;">&nbsp;</div>
											</div>
										</div></td>
								</tr>
								<tr class="fc-week fc-last">
									<td
										class="fc-day fc-sun fc-widget-content fc-other-month fc-future fc-first"
										data-date="2014-05-04"><div style="min-height: 96px;">
											<div class="fc-day-number">4</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td
										class="fc-day fc-mon fc-widget-content fc-other-month fc-future"
										data-date="2014-05-05"><div>
											<div class="fc-day-number">5</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td
										class="fc-day fc-tue fc-widget-content fc-other-month fc-future"
										data-date="2014-05-06"><div>
											<div class="fc-day-number">6</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td
										class="fc-day fc-wed fc-widget-content fc-other-month fc-future"
										data-date="2014-05-07"><div>
											<div class="fc-day-number">7</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td
										class="fc-day fc-thu fc-widget-content fc-other-month fc-future"
										data-date="2014-05-08"><div>
											<div class="fc-day-number">8</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td
										class="fc-day fc-fri fc-widget-content fc-other-month fc-future"
										data-date="2014-05-09"><div>
											<div class="fc-day-number">9</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td
										class="fc-day fc-sat fc-widget-content fc-other-month fc-future fc-last"
										data-date="2014-05-10"><div>
											<div class="fc-day-number">10</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>/.box-body
	</div>/. box
</section> -->
<script src="/GatheringWeb/resources/shared/js/gatheringfullcalendar.js" type="text/javascript"></script>