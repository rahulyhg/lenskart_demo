<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Lenskart</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
      
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="home">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{{url('/products')}}">Products</a>
              </li>
            <li class="nav-item">
              <a class="nav-link" href="{{url('/customers')}}">Customers</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" href="{{url('/orders')}}">Orders</a>
              </li>
            <li class="nav-item">
                    <a class="nav-link" href="/about">About Us</a>
            </li>
          </ul>
         
        </div>
      </nav><br>