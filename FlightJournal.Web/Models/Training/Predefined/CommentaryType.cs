﻿using FlightJournal.Web.Models.Training.Flight;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace FlightJournal.Web.Models.Training.Predefined
{
    public class CommentaryType //TODO: rename to FlightPhase ?
    {
        [Key]
        public int CommentaryTypeId { get; set; }
        public string CType { get; set; }
        public int DisplayOrder { get; set; }
        public virtual ICollection<Commentary> Commentaries { get; set; }
        public virtual ICollection<TrainingFlightAnnotationCommentCommentType> TrainingFlightAnnotationCommentCommentTypes { get; set; }
    }
}