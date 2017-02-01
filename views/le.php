<?php
if(!empty($message)) {
	$messagehtml = '<div class="alert alert-' . $message['type'] .'">'. $message['message'] . '</div>';
}

$fwapi = \FreePBX::Certman()->getFirewallAPI();
$letext = sprintf(_("LetsEncrypt requires the following hosts to be permitted for inbound http access:<br /> <tt>%s</tt>"), join(", ", $fwapi->getRequiredHosts()));

// Is firewall enabled and available?
if ($fwapi->isAvailable()) {
	// Are our hosts already set up?
	if (!$fwapi->hostsConfigured()) {
		// They're not. Add a warning and a button
		$alert = "<form class='fpbx-submit' name='frm_fixfirewall' id='updatefw' method='post'>";
		$alert .= "<div class='alert alert-warning'><h3>"._("Firewall Warning")."</h3>";
		$alert .= "<p class='col-sm-12'>$letext</p>"; // Adding col-sm-12 fixes the padding in the alert
		$alert .= "<div class='clearfix'><p class='col-sm-9'>"._("These hosts <strong>are not configured in the System Firewall</strong>. LetsEncrypt will not be able to validate this host, and certificate issueance will fail. To automatically add these hosts, please click on the 'Update Firewall' button.")."</p>";
		$alert .= "<p class='col-sm-3'><button class='btn btn-default pull-right' type='submit' name='updatefw' value='updatefw'>"._("Update Firewall")."</button></p></div>";
		$alert .= "</div></form>";
	} else {
		$alert = "<div class='alert alert-success'><h3>"._("Firewall Validated")."</h3>";
		$alert .= "<p>$letext</p>";
		$alert .= "<p>"._("These entries are correctly set up in the Firewall module. However, it's possible that other external firewalls may block access. If you are having problems validating your certificate, this could be the issue.")."</p>";
		$alert .= "</div>";
	}
} else {
	$alert = "<div class='alert alert-info'><h3>"._("Firewall Warning")."</h3>";
	$alert .= "<p>$letext</p>";
	$alert .= "<p>"._("PBX System Firewall is not in use so this can not be verified. Please manually verify inbound connectivity.")."</p>";
	$alert .= "</div>";
}
?>

<div class="container-fluid">
	<h1><?php echo !empty($cert['cid']) ? _("Edit Let's Encrypt Certificate") : _("New Let's Encrypt Certificate")?></h1>
	<?php echo !empty($messagehtml) ? $messagehtml : "" ?>
	<?php echo $alert; ?>
	<div class='alert alert-info'><?php echo _("Let's Encrypt Certificates are time limited to 90 days. At around 30 days left the PBX will attempt to automatically update your certificate and all services using this certificate. Please do not install your own certifcate updaters")?></div>
	<div class = "display full-border">
		<div class="row">
			<div class="col-sm-12">
				<div class="fpbx-container">
					<div class="display full-border" id='certpage'>
						<form class="fpbx-submit" name="frm_certman" action="config.php?display=certman" method="post" enctype="multipart/form-data">
							<input id="certaction" type="hidden" name="certaction" value="<?php echo !empty($cert['cid']) ? 'edit' : 'add'?>">
							<input id="certtype" type="hidden" name="type" value="le">
							<input id="cid" type="hidden" name="cid" value="<?php echo !empty($cert['cid']) ? $cert['cid'] : ''?>">
							<div class="element-container">
								<div class="row">
									<div class="form-group">
										<div class="col-md-3">
											<label class="control-label" for="host"><?php echo _("Host Name")?></label>
										</div>
										<div class="col-md-9">
											<?php if (empty($cert['cid'])) { ?>
												<input type="text" class="form-control" id="host" name="host" placeholder="server.example.com" required value="<?php echo $hostname?>">
											<?php } else { ?>
												<?php echo !empty($cert['basename']) ? $cert['basename'] : ""?>
											<?php } ?>
										</div>
									</div>
								</div>
							</div>
							<div class="element-container">
								<div class="row">
									<div class="form-group">
										<div class="col-md-3">
											<label class="control-label" for="email"><?php echo _("Owners Email")?></label>
											<i class="fa fa-question-circle fpbx-help-icon" data-for="email"></i>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control" id="email" name="email" placeholder="you@example.com" required value="<?php echo $email?>">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<span id="email-help" class="help-block fpbx-help-block" style=""><?php echo _("This email address is given to Let's Encrypt. It may be used by them if the certificate is approaching expiration and it has not been renewed. Optional, but recommended.")?></span>
									</div>
								</div>
							</div>
							<?php if(!empty($cert['cid'])) { ?>
								<div class="element-container">
									<div class="row">
										<div class="form-group">
											<div class="col-md-3">
												<label class="control-label" for="expires"><?php echo _("Valid Until")?></label>
											</div>
											<div class="col-md-9"> <?php echo \FreePBX::Certman()->getReadableExpiration($certinfo['validTo_time_t']); ?> </div>
										</div>
									</div>
								</div>
								<div class="element-container">
									<div class="row">
										<div class="form-group">
											<div class="col-md-3">
												<label class="control-label" for="cn"><?php echo _("Common Name")?></label>
											</div>
											<div class="col-md-9">
												<?php echo $certinfo['subject']['CN']?>
											</div>
										</div>
									</div>
								</div>
								<?php if(!empty($certinfo['extensions']['certificatePolicies'])) {?>
									<div class="element-container">
										<div class="row">
											<div class="form-group">
												<div class="col-md-3">
													<label class="control-label" for="cp"><?php echo _("Certificate Policies")?></label>
													<i class="fa fa-question-circle fpbx-help-icon" data-for="cp"></i>
												</div>
												<div class="col-md-9">
													<textarea class="form-control" readonly><?php echo $certinfo['extensions']['certificatePolicies']?></textarea>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<span id="cp-help" class="help-block fpbx-help-block" style=""><?php echo _('A certificate policy (CP) is a document which aims to state what are the different actors of a public key infrastructure (PKI), their roles and their duties')?></span>
											</div>
										</div>
									</div>
								<?php } ?>
							<?php } ?>
							<!-- Challenge Method -->
							<div class="element-container">
								<div class="row">
									<div class="form-group">
										<div class="col-md-3">
											<label class="control-label" for="challengetype"><?php echo _("Challenge Over")?></label>
											<i class="fa fa-question-circle fpbx-help-icon" data-for="challengetype"></i>
										</div>
										<div class="col-md-9 radioset">
											<input type="radio" class="" id="challengetype_http" name="challengetype" value="http" <?php echo empty($cert['additional']['challengetype']) || (!empty($cert['additional']['challengetype']) && $cert['additional']['challengetype'] == 'http') ? 'checked' : ""?>>
											<label for="challengetype_http">HTTP</label>
											<input type="radio" class="" id="challengetype_https" name="challengetype" value="https" <?php echo !empty($cert['additional']['challengetype']) && $cert['additional']['challengetype'] == 'https' ? 'checked' : ""?>>
											<label for="challengetype_https">HTTPS</label>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<span id="challengetype-help" class="help-block fpbx-help-block"><?php echo _("This is the method that Let's Encrypt will use to verify this machine. The default is HTTP on port 80.")?></span>
									</div>
								</div>
							</div>
							<!-- END Challenge Method -->
							<div class="element-container">
								<div class="row">
									<div class="form-group">
										<div class="col-md-3">
											<label class="control-label" for="C"><?php echo _("Country")?></label>
										</div>
										<div class="col-md-9">
<?php 
$country = !empty($cert['additional']['C']) ? $cert['additional']['C'] : "CA"; 
$state = !empty($cert['additional']['ST']) ? $cert['additional']['ST'] : "Ontario";
?>
											<select class="form-control" id="C" name="C" data-current="<?php echo $country; ?>" disabled> </select>
										</div>
									</div>
								</div>
							</div>
							<div class="element-container">
								<div class="row">
									<div class="form-group">
										<div class="col-md-3">
											<label class="control-label" for="st"><?php echo _("State/Province/Region")?></label>
										</div>
										<div class="col-md-9">
											<select class="form-control" id="ST" name="ST" data-current="<?php echo $state; ?>"> </select>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
