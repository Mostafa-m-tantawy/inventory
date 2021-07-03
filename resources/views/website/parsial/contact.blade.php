<div class="modal fade" id="modal-contact-form" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>
            <div class="modal-body">

                <!--contact form-->

                <div class="contact-form text-center">
                    <header class="section-header"><img src="img/support-icon.svg" alt="support icon">
                        <h2>{{trans('main.Contact us')}}</h2>
                        <h3>{{trans('main.Have any questions? Send us a message.')}}</h3>
                    </header>
                    <form class="cta-form cta-light" action="{{route('email-me')}}"
                          method="post">
                        @csrf
                        <div class="form-group">
                            <input type="text" name="name" class="contact-name form-control input-lg"
                                   placeholder="Name *" id="contact-name">
                        </div>
                        <div class="form-group">
                            <input type="text" name="email" class="contact-email form-control input-lg"
                                   placeholder="Email address *" id="contact-email">
                        </div>
                        <div class="form-group">
                            <textarea name="message" class="contact-message form-control input-lg" rows="4"
                                      placeholder="Message *" id="contact-message"></textarea>
                        </div>

                        <button type="submit" class="btn">{{trans('main.SEND MESSAGE')}}</button>
                    </form>
                </div>

                <!--contact form end-->

                <p class="contact-form-success"><i
                        class="fa fa-check"></i><span>{{trans('main.Thanks for contacting us!')}}</span> {{trans('main.We will get back to you very soon.')}}
                </p>
            </div>
        </div>
    </div>
</div>
