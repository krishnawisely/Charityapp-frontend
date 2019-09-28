$(function(){
            console.log('This is jquery!');
            let url = "http://localhost:8080/Charityapp-api/ListDonorServlet";
            $.get(url,(res)=>{
                console.log(res);
                let resData = JSON.parse(res);
                let donorList = "";
                for(let donor of resData)
                {
                    donorList += "<tr><td>"+donor.name+"</td>";
                    donorList += "<td>"+donor.email+"</td>";
                    donorList += "<td>"+donor.dateOfBirth.day+"-"+donor.dateOfBirth.month+"-"+donor.dateOfBirth.year+"</td>";
                    donorList += "<td><button class='btn btn-outline-success'>Activate</button>"
                    +"<button class='btn btn-outline-danger'>Activate</button>"+"</td>";
                    donorList += "</tr>";
                }
                $('#donorList').html(donorList);
                // console.log(res.name);
            });
        });