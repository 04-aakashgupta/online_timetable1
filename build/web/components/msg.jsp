<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="msg">
    <!-- Vertically centered modal -->
    <div class="text-center mt-5"   >
        <button type="button" class="btn btn-primary mt-5 px-5" data-bs-toggle="modal" data-bs-target="#exampleModal">
            Msg
        </button>
    </div>




    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
                <a href="vacation.jsp"></a>
                <div class="modal-header">
                    <h4 class="modal-title text-success" id="exampleModalLabel"> <%= application.getAttribute(session.getAttribute("branch").toString() + "msgtitle")%></h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <h5>

                        <%= application.getAttribute(session.getAttribute("branch").toString() + "msg")%>
                        </h2>

                </div>
                <div class="modal-footer ">
                    <div class="mx-auto">
                        <button type="button" class="btn btn-secondary btn-lg " data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>



</div>

