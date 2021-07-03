<!DOCTYPE html>
<html lang="ar">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <style>
        table.with-border th, table.with-border td {
            border: 1px solid grey;
        }

        body {
            font-family: DejaVu Sans;
            direction: {{(App::getLocale() ==  'en') ? 'ltr':'rtl'}};
        }

        .item{
            text-align: {{(App::getLocale() ==  'en') ? 'left':'right'}};
            float: {{(App::getLocale() ==  'en') ? 'left':'right'}};
        }
        .size{
            text-align: {{(App::getLocale() ==  'en') ? 'left':'right'}};
          }
        .quantity{
            text-align: center;
        }
        .price{
            text-align: {{(App::getLocale() ==  'en') ? 'right':'left'}};
            float: {{(App::getLocale() ==  'en') ? 'right':'left'}};
        }

    </style>
</head>


<body >
<div class="" id="printNow" style="text-align: center ; font-size: 2.5em; height: 100%;width: 100%;">

   <table style="font-size: 2em; width: 100%;">
    </tr>
       <tr>
        <td class="item">{{ trans('main.name') }} </td>
        <td class="price">{{$supplier->user->name}}</td>
    </tr>
       <tr>
        <td class="item">{{ trans('main.email') }}</td>
           <td class="price">{{$supplier->user->email}}</td>
    </tr>
   </table>

    <hr><br><br>

    <table class="table" style=" font-size: 2em; width: 100%">
        <tbody>
        <tr>
            <td class="item">{{trans('main.Starting Balance')}} </td>
            <th class="price" style="color: green"> +${{number_format($supplier->start_balance,2)}}</th>
        </tr>

        <tr>
            <td class="item">
                <span>{{trans('main.purchases')}} </span>
            </td>
            <th class="price" style="color: green">+${{number_format($supplier->GrossPurchases,2)}}</th>
        </tr>


        <tr>
            <td class="item"> {{ trans('main.refunds') }} :</td>
            <th class="price"style="color: red">-${{number_format($supplier->GrossRefunds,2)}} </th>
        </tr>


        <tr>
            <td class="item"> {{trans('main.payment')}} :</td>
            <th class="price"style="color: red">-${{number_format($supplier->GrossPayments,2)}} </th>
        </tr>

        <tr>
            <td class="item"> {{trans('main.dept')}} :</td>
            <th class="price" style="color: green">${{number_format($supplier->start_balance+$supplier->GrossPurchases-$supplier->GrossRefunds-$supplier->GrossPayments,2)}} </th>
        </tr>

        </tbody>
    </table>

</div>
</body>
</html>
