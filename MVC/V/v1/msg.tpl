<div class="container">
	<!-- class="display table table-striped table-bordered"-->
	<table id="myTable" class="display">
	    <thead>
	        <tr>
	            <th>driver_name</th>
	            <th>start_place</th>
	            <th>end_place</th>
	            <th>car_num</th>
	            <th>kilometres</th>
	            <th>unit_price</th>
	            <th>amount</th>
	            <th>bu_amount</th>
	            <th>remark</th>
	        </tr>
	    </thead>
	    <tbody>
	    	
	    </tbody>
	</table>
</div>
<script>
    //然后 DataTables 这样初始化：
    $('#myTable').DataTable({
        ajax: "/index/driverDetail/",
       	columns: [
            { data: 'driver_name' },
            { data: 'start_place' },
            { data: 'end_place' },
            { data: 'car_num' },
            { data: 'kilometres' },
            { data: 'unit_price' },
            { data: 'amount' },
            { data: 'bu_amount' },
            { data: 'remark' }
        ]
    });
</script>
